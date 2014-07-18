class DatabaseUpdater
  # DatabaseUpdater.start
  def self.start
    new.start
  end

  def start
    created_tables = 0

    models.each do |model|
      next if model.table_exists?

      created_tables += 1

      generate_table(model.table_name)
    end

    puts "#{created_tables} tabelas criadas"
  end

  # DatabaseUpdater.copy
  def self.copy
    new.copy
  end

  def copy
    timer = {}

    models.each do |model|
      puts "#{model}"

      timer[model] = Time.current

      Transmitter.start(model)

      timer[model] = TimeDifference.between(
        timer[model],
        Time.current
      ).in_minutes
    end

    timer.each do |model, time|
      puts "#{model}: #{time} min"
    end

    puts "TOTAL: #{timer.values.sum} min"
  end

  # DatabaseUpdater.copy_n_to_n
  def self.copy_n_to_n(*attr)
    new(*attr).copy_n_to_n
  end

  def copy_n_to_n
    models = [DistributorStockOperation, ProductModelColor]

    models.each do |model|
      Transmitter.n_to_n(model)
    end
  end

  private

  def models
    [
      Country, State, City, Brand, Distributor, Partner, Manager, Domain, Group,
      User, Operator, Associate, ProductFabricator, ProductModel, Tariff,
      CommercialTable, Plan, OperatorAccount, Number, MasterOperatorContract,
      MasterManagerContract, MasterDistributorContract, RequestType, StockOperation,
      Request, Service, Color, ProductLevel, LineGroup, InternetPlan, Negotiation,
      Sell, AssociateLine, StockProduct, ComodatoMovement, Comodato, ProcessType,
      ProcessStep, ProcessStepResponsible, BillPeriod, AssociateBill, LineBill,
      FranchiseMovement, DistributorConfiguration, TicketContactType, BillAdditionType,
      BillDiscountType, Bill, FacilityPackage, AssociateLinePlan, BillAddition,
      BillAdditionItem, BillDiscount, BillDiscountItem, AssociateLineService,
      ServiceBill, AssociateUser, AssociateCancel, AssociateUserLine, Block,
      ChipMaintenanceType, ChipMaintenance, Contact, DistributorInternetPlan,
      DistributorPlan, DistributorService, DistributorTarget, Invoice, InvoiceItem,
      LineCancellation, LineCancellationItem, NegotiationInternet, NegotiationProduct,
      NegotiationService, NumberShift, OperationControl, OperationControlService,
      PackagePrice, Permit, PlanShift, PlanShiftItem, PlanTariff, ProcessStepAction,
      ProductMatrix, RemoteRequest, Repayment, RequestItem, Role, SellInternetItem,
      SellPlanItem, SellPlanItemService, ServiceOperation, ServiceOperationItem,
      ServiceTariff, Sms, StockAdjust, StockAdjustEntry, StockAdjustOutput,
      StockMovement, StockMovementItem, ReservedProduct, ReservedProductItem,
      TariffMasterPrice, TariffOperator, TariffOperatorPrice, TicketType,
      TicketSubType, Ticket, Tour, TourAssociate, TourStep, TransferTitle,
      TransferTitleItem, Address, ProcessManager, Archive, ProcessFlow,
      StockProductChosen, StockProductChosenItem, TicketFlow, LineConsumption,
      ImportCall, Call, Comment
    ]
  end

  def generate_table(table_name)
    ActiveRecord::Base.connection.execute <<-SQL
      CREATE TABLE #{table_name}
      (
        id serial NOT NULL,
        old_id integer NOT NULL,
        new_id integer NOT NULL,
        CONSTRAINT #{table_name}_pkey PRIMARY KEY (id)
      )
      WITH (
        OIDS=FALSE
      );
      ALTER TABLE #{table_name}
        OWNER TO postgres;

      CREATE INDEX index_#{table_name}_old_id
        ON #{table_name}
        USING btree
        (old_id);

      CREATE INDEX index_#{table_name}_new_id
        ON #{table_name}
        USING btree
        (new_id);
    SQL
  end
end
