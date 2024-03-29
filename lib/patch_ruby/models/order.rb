=begin
#Patch API V2

#The core API used to integrate with Patch's service

The version of the OpenAPI document: 2
Contact: engineering@usepatch.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.3.1

=end

require 'date'
require 'time'

module Patch
  class Order
    # A unique uid for the record. UIDs will be prepended by ord_prod or ord_test depending on the mode it was created in.
    attr_accessor :id

    # The timestamp at which the order was created
    attr_accessor :created_at

    # A boolean indicating if this order is a production or demo mode order.
    attr_accessor :production

    # The current state of the order.
    attr_accessor :state

    # The amount in `unit`s purchased through this order.
    attr_accessor :amount

    # The unit of measurement (ie \"g\" or \"Wh\") for the `amount` ordered.
    attr_accessor :unit

    # The total price for the `amount` ordered. Prices are always represented in the smallest currency unit (ie cents for USD).
    attr_accessor :price

    # The Patch Fee for this order. Patch Fee is always represented in the smallest currency unit (ie cents for USD).
    attr_accessor :patch_fee

    # The currency code for the `price` and `patch_fee`.
    attr_accessor :currency

    # The URL of this order in the public registry. Use this URL to access the order's accompanying certificate.
    attr_accessor :registry_url

    # An optional JSON object containing metadata for this order.
    attr_accessor :metadata

    # An array containing the line items allocated for this order. Line items are grouped by project, vintage year, and price.
    attr_accessor :line_items

    # An object containing the name & email of the party the inventory will be issued to.
    attr_accessor :issued_to

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'created_at' => :'created_at',
        :'production' => :'production',
        :'state' => :'state',
        :'amount' => :'amount',
        :'unit' => :'unit',
        :'price' => :'price',
        :'patch_fee' => :'patch_fee',
        :'currency' => :'currency',
        :'registry_url' => :'registry_url',
        :'metadata' => :'metadata',
        :'line_items' => :'line_items',
        :'issued_to' => :'issued_to'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'id' => :'String',
        :'created_at' => :'Time',
        :'production' => :'Boolean',
        :'state' => :'String',
        :'amount' => :'Integer',
        :'unit' => :'String',
        :'price' => :'Integer',
        :'patch_fee' => :'Integer',
        :'currency' => :'String',
        :'registry_url' => :'String',
        :'metadata' => :'Object',
        :'line_items' => :'Array<OrderLineItem>',
        :'issued_to' => :'OrderIssuedTo'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end


    # Allows models with corresponding API classes to delegate API operations to those API classes
    # Exposes Model.operation_id which delegates to ModelsApi.new.operation_id
    # Eg. Order.create_order delegates to OrdersApi.new.create_order
    def self.method_missing(message, *args, &block)
      if Object.const_defined?('Patch::OrdersApi::OPERATIONS') && Patch::OrdersApi::OPERATIONS.include?(message)
        Patch::OrdersApi.new.send(message, *args)
      else
        super
      end
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Patch::Order` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Patch::Order`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'created_at')
        self.created_at = attributes[:'created_at']
      end

      if attributes.key?(:'production')
        self.production = attributes[:'production']
      end

      if attributes.key?(:'state')
        self.state = attributes[:'state']
      end

      if attributes.key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.key?(:'unit')
        self.unit = attributes[:'unit']
      end

      if attributes.key?(:'price')
        self.price = attributes[:'price']
      end

      if attributes.key?(:'patch_fee')
        self.patch_fee = attributes[:'patch_fee']
      end

      if attributes.key?(:'currency')
        self.currency = attributes[:'currency']
      end

      if attributes.key?(:'registry_url')
        self.registry_url = attributes[:'registry_url']
      end

      if attributes.key?(:'metadata')
        self.metadata = attributes[:'metadata']
      end

      if attributes.key?(:'line_items')
        if (value = attributes[:'line_items']).is_a?(Array)
          self.line_items = value
        end
      end

      if attributes.key?(:'issued_to')
        if (value = attributes[:'issued_to']).is_a?(Hash)
          self.issued_to = value
        end
        self.issued_to = attributes[:'issued_to']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @id.nil?
        invalid_properties.push('invalid value for "id", id cannot be nil.')
      end

      if @production.nil?
        invalid_properties.push('invalid value for "production", production cannot be nil.')
      end

      if @state.nil?
        invalid_properties.push('invalid value for "state", state cannot be nil.')
      end

      if @amount.nil?
        invalid_properties.push('invalid value for "amount", amount cannot be nil.')
      end

      if @amount > 100000000000000
        invalid_properties.push('invalid value for "amount", must be smaller than or equal to 100000000000000.')
      end

      if @amount < 0
        invalid_properties.push('invalid value for "amount", must be greater than or equal to 0.')
      end

      if @unit.nil?
        invalid_properties.push('invalid value for "unit", unit cannot be nil.')
      end

      if @price.nil?
        invalid_properties.push('invalid value for "price", price cannot be nil.')
      end

      if @patch_fee.nil?
        invalid_properties.push('invalid value for "patch_fee", patch_fee cannot be nil.')
      end

      if @currency.nil?
        invalid_properties.push('invalid value for "currency", currency cannot be nil.')
      end

      if @metadata.nil?
        invalid_properties.push('invalid value for "metadata", metadata cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @id.nil?
      return false if @production.nil?
      return false if @state.nil?
      state_validator = EnumAttributeValidator.new('String', ["draft", "reserved", "placed", "processing", "complete", "cancelled"])
      return false unless state_validator.valid?(@state)
      return false if @amount.nil?
      return false if @amount > 100000000000000
      return false if @amount < 0
      return false if @unit.nil?
      return false if @price.nil?
      return false if @patch_fee.nil?
      return false if @currency.nil?
      return false if @metadata.nil?
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] state Object to be assigned
    def state=(state)
      validator = EnumAttributeValidator.new('String', ["draft", "reserved", "placed", "processing", "complete", "cancelled"])
      unless validator.valid?(state)
        fail ArgumentError, "invalid value for \"state\", must be one of #{validator.allowable_values}."
      end
      @state = state
    end

    # Custom attribute writer method with validation
    # @param [Object] amount Value to be assigned
    def amount=(amount)
      if amount.nil?
        fail ArgumentError, 'amount cannot be nil'
      end

      if amount > 100000000000000
        fail ArgumentError, 'invalid value for "amount", must be smaller than or equal to 100000000000000.'
      end

      if amount < 0
        fail ArgumentError, 'invalid value for "amount", must be greater than or equal to 0.'
      end

      @amount = amount
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          created_at == o.created_at &&
          production == o.production &&
          state == o.state &&
          amount == o.amount &&
          unit == o.unit &&
          price == o.price &&
          patch_fee == o.patch_fee &&
          currency == o.currency &&
          registry_url == o.registry_url &&
          metadata == o.metadata &&
          line_items == o.line_items &&
          issued_to == o.issued_to
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, created_at, production, state, amount, unit, price, patch_fee, currency, registry_url, metadata, line_items, issued_to].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.openapi_types.each_pair do |key, type|
        if attributes[self.class.attribute_map[key]].nil? && self.class.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet) or oneOf
        klass = Patch.const_get(type)
        klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end
