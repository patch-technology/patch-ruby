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
  class CreateOrderLineItemRequest
    attr_accessor :project_id

    attr_accessor :vintage_year

    attr_accessor :vintage_start_year

    attr_accessor :vintage_end_year

    attr_accessor :price

    attr_accessor :currency

    attr_accessor :amount

    attr_accessor :unit

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
        :'project_id' => :'project_id',
        :'vintage_year' => :'vintage_year',
        :'vintage_start_year' => :'vintage_start_year',
        :'vintage_end_year' => :'vintage_end_year',
        :'price' => :'price',
        :'currency' => :'currency',
        :'amount' => :'amount',
        :'unit' => :'unit'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'project_id' => :'String',
        :'vintage_year' => :'Integer',
        :'vintage_start_year' => :'Integer',
        :'vintage_end_year' => :'Integer',
        :'price' => :'Integer',
        :'currency' => :'String',
        :'amount' => :'Integer',
        :'unit' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'vintage_year',
        :'vintage_start_year',
        :'vintage_end_year',
        :'price',
        :'currency',
        :'amount',
        :'unit'
      ])
    end


    # Allows models with corresponding API classes to delegate API operations to those API classes
    # Exposes Model.operation_id which delegates to ModelsApi.new.operation_id
    # Eg. Order.create_order delegates to OrdersApi.new.create_order
    def self.method_missing(message, *args, &block)
      if Object.const_defined?('Patch::CreateOrderLineItemRequestsApi::OPERATIONS') && Patch::CreateOrderLineItemRequestsApi::OPERATIONS.include?(message)
        Patch::CreateOrderLineItemRequestsApi.new.send(message, *args)
      else
        super
      end
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Patch::CreateOrderLineItemRequest` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Patch::CreateOrderLineItemRequest`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'project_id')
        self.project_id = attributes[:'project_id']
      end

      if attributes.key?(:'vintage_year')
        self.vintage_year = attributes[:'vintage_year']
      end

      if attributes.key?(:'vintage_start_year')
        self.vintage_start_year = attributes[:'vintage_start_year']
      end

      if attributes.key?(:'vintage_end_year')
        self.vintage_end_year = attributes[:'vintage_end_year']
      end

      if attributes.key?(:'price')
        self.price = attributes[:'price']
      end

      if attributes.key?(:'currency')
        self.currency = attributes[:'currency']
      end

      if attributes.key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.key?(:'unit')
        self.unit = attributes[:'unit']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@vintage_year.nil? && @vintage_year > 2225
        invalid_properties.push('invalid value for "vintage_year", must be smaller than or equal to 2225.')
      end

      if !@vintage_year.nil? && @vintage_year < 1900
        invalid_properties.push('invalid value for "vintage_year", must be greater than or equal to 1900.')
      end

      if !@vintage_start_year.nil? && @vintage_start_year > 2225
        invalid_properties.push('invalid value for "vintage_start_year", must be smaller than or equal to 2225.')
      end

      if !@vintage_start_year.nil? && @vintage_start_year < 1900
        invalid_properties.push('invalid value for "vintage_start_year", must be greater than or equal to 1900.')
      end

      if !@vintage_end_year.nil? && @vintage_end_year > 2225
        invalid_properties.push('invalid value for "vintage_end_year", must be smaller than or equal to 2225.')
      end

      if !@vintage_end_year.nil? && @vintage_end_year < 1900
        invalid_properties.push('invalid value for "vintage_end_year", must be greater than or equal to 1900.')
      end

      if !@price.nil? && @price < 2
        invalid_properties.push('invalid value for "price", must be greater than or equal to 2.')
      end

      if !@amount.nil? && @amount > 100000000000000
        invalid_properties.push('invalid value for "amount", must be smaller than or equal to 100000000000000.')
      end

      if !@amount.nil? && @amount < 0
        invalid_properties.push('invalid value for "amount", must be greater than or equal to 0.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@vintage_year.nil? && @vintage_year > 2225
      return false if !@vintage_year.nil? && @vintage_year < 1900
      return false if !@vintage_start_year.nil? && @vintage_start_year > 2225
      return false if !@vintage_start_year.nil? && @vintage_start_year < 1900
      return false if !@vintage_end_year.nil? && @vintage_end_year > 2225
      return false if !@vintage_end_year.nil? && @vintage_end_year < 1900
      return false if !@price.nil? && @price < 2
      return false if !@amount.nil? && @amount > 100000000000000
      return false if !@amount.nil? && @amount < 0
      unit_validator = EnumAttributeValidator.new('String', ["g"])
      return false unless unit_validator.valid?(@unit)
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] vintage_year Value to be assigned
    def vintage_year=(vintage_year)
      if !vintage_year.nil? && vintage_year > 2225
        fail ArgumentError, 'invalid value for "vintage_year", must be smaller than or equal to 2225.'
      end

      if !vintage_year.nil? && vintage_year < 1900
        fail ArgumentError, 'invalid value for "vintage_year", must be greater than or equal to 1900.'
      end

      @vintage_year = vintage_year
    end

    # Custom attribute writer method with validation
    # @param [Object] vintage_start_year Value to be assigned
    def vintage_start_year=(vintage_start_year)
      if !vintage_start_year.nil? && vintage_start_year > 2225
        fail ArgumentError, 'invalid value for "vintage_start_year", must be smaller than or equal to 2225.'
      end

      if !vintage_start_year.nil? && vintage_start_year < 1900
        fail ArgumentError, 'invalid value for "vintage_start_year", must be greater than or equal to 1900.'
      end

      @vintage_start_year = vintage_start_year
    end

    # Custom attribute writer method with validation
    # @param [Object] vintage_end_year Value to be assigned
    def vintage_end_year=(vintage_end_year)
      if !vintage_end_year.nil? && vintage_end_year > 2225
        fail ArgumentError, 'invalid value for "vintage_end_year", must be smaller than or equal to 2225.'
      end

      if !vintage_end_year.nil? && vintage_end_year < 1900
        fail ArgumentError, 'invalid value for "vintage_end_year", must be greater than or equal to 1900.'
      end

      @vintage_end_year = vintage_end_year
    end

    # Custom attribute writer method with validation
    # @param [Object] price Value to be assigned
    def price=(price)
      if !price.nil? && price < 2
        fail ArgumentError, 'invalid value for "price", must be greater than or equal to 2.'
      end

      @price = price
    end

    # Custom attribute writer method with validation
    # @param [Object] amount Value to be assigned
    def amount=(amount)
      if !amount.nil? && amount > 100000000000000
        fail ArgumentError, 'invalid value for "amount", must be smaller than or equal to 100000000000000.'
      end

      if !amount.nil? && amount < 0
        fail ArgumentError, 'invalid value for "amount", must be greater than or equal to 0.'
      end

      @amount = amount
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] unit Object to be assigned
    def unit=(unit)
      validator = EnumAttributeValidator.new('String', ["g"])
      unless validator.valid?(unit)
        fail ArgumentError, "invalid value for \"unit\", must be one of #{validator.allowable_values}."
      end
      @unit = unit
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          project_id == o.project_id &&
          vintage_year == o.vintage_year &&
          vintage_start_year == o.vintage_start_year &&
          vintage_end_year == o.vintage_end_year &&
          price == o.price &&
          currency == o.currency &&
          amount == o.amount &&
          unit == o.unit
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [project_id, vintage_year, vintage_start_year, vintage_end_year, price, currency, amount, unit].hash
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
