class Transmitter
  def initialize(model)
    @model = model
    @table_name = model.table_name
    model.connection
  end

  # Transmitter.start(Country)
  def self.start(*attr)
    new(*attr).start
  end

  def start
    last_id = 0

    begin
      return if model.using(:source).count == model.count

      records = model.using(:source).order('id').limit(1000).where('id > ?', last_id)

      break if records.size == 0

      last_id = records.last.id

      records.to_a.each do |source_record|
        next if model.unscoped.find_by(old_id: source_record.id)

        attributes = source_record.attributes
        old_id = attributes.delete('id')

        new_record = model.using(:destiny).create!(
          if model == ImportCall
            attributes
          else
            configure_attributes(attributes, source_record)
          end
        )

        add(old_id, new_record.id)
      end

      records = []
    end while records.size > 0
  end

  # Transmitter.n_to_n
  def self.n_to_n(*attr)
    new(*attr).n_to_n
  end

  def n_to_n
    records = model.using(:source).all

    records.to_a.each do |source_record|
      attributes = source_record.attributes
      attributes.delete(nil)

      model.using(:destiny).create!(
        configure_attributes(attributes, source_record)
      )
    end
  end

  private

  attr_reader :model, :table_name

  def configure_attributes(attributes, source_record)
    attributes.each do |key, value|
      if key.include?('_id') && value.present?
        methods = model.reflect_on_all_associations(:belongs_to).
          select { |a| a.foreign_key.to_sym == key.to_sym }

        if methods.size == 1
          method = methods.last.name
        else
          method = key.gsub('_id', '')
        end

        relation = source_record.send(method)

        raise "#{method} not found at #{model} #{source_record.id}" if relation.blank?

        record = relation.class.unscoped.find_by(old_id: value)

        raise "#{model} - #{relation.class} - #{key} - #{value} (old_id) not found" unless record

        attributes[key] = record.new_id
      end
    end

    attributes
  end

  def add(old_id, new_id)
    ActiveRecord::Base.connection.execute <<-SQL
      INSERT INTO #{table_name} (old_id, new_id)
      VALUES (#{old_id}, #{new_id});
    SQL
  end
end
