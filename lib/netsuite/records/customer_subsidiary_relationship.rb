module NetSuite
  module Records
    class CustomerSubsidiaryRelationship
      include Support::Records
      include Support::Actions

      actions :get, :get_list, :add, :search

      # https://system.netsuite.com/help/helpcenter/en_US/srbrowser/Browser2024_1/schema/record/customersubsidiaryrelationship.html

      fields :is_primary_sub, :is_inactive

      field :subsidiary,          Subsidiary
      field :custom_field_list,   CustomFieldList

      record_refs :entity, :primary_currency

      attr_reader :internal_id
      attr_accessor :external_id

      def initialize(attributes = {})
        @internal_id = attributes.delete(:internal_id) || attributes.delete(:@internal_id)
        @external_id = attributes.delete(:external_id) || attributes.delete(:@external_id)

        initialize_from_attributes_hash(attributes)
      end

    end
  end
end
