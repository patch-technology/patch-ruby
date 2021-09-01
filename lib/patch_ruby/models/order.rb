=begin
#Patch API V1

#The core API used to integrate with Patch's service

The version of the OpenAPI document: v1
Contact: developers@usepatch.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.2.1

=end

require 'date'
require 'time'

module Patch
  class Order
    # A unique uid for the record. UIDs will be prepended by ord_prod or ord_test depending on the mode it was created in.
    attr_accessor :id

    # The amount of carbon offsets in grams purchased through this order.
    attr_accessor :mass_g

    # A boolean indicating if this order is a production or test mode order.
    attr_accessor :production

    # The current state of the order.
    attr_accessor :state

    # The current state of the allocated carbon offsets of the order.
    attr_accessor :allocation_state

    # The total price in cents USD of the carbon offsets purchased through this order.
    attr_accessor :price_cents_usd

    # The Patch Fee in cents USD for this order.
    attr_accessor :patch_fee_cents_usd

    # An array containing the inventory allocations for this order.
    attr_accessor :allocations

    # The url of this order in the public registry.
    attr_accessor :registry_url

    # An optional JSON object containing metadata for this order.
    attr_accessor :metadata

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
        :'mass_g' => :'mass_g',
        :'production' => :'production',
        :'state' => :'state',
        :'allocation_state' => :'allocation_state',
        :'price_cents_usd' => :'price_cents_usd',
        :'patch_fee_cents_usd' => :'patch_fee_cents_usd',
        :'allocations' => :'allocations',
        :'registry_url' => :'registry_url',
        :'metadata' => :'metadata'
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
        :'mass_g' => :'Integer',
        :'production' => :'Boolean',
        :'state' => :'String',
        :'allocation_state' => :'String',
        :'price_cents_usd' => :'Integer',
        :'patch_fee_cents_usd' => :'Integer',
        :'allocations' => :'Array<Allocation>',
        :'registry_url' => :'String',
        :'metadata' => :'Object'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'price_cents_usd',
        :'patch_fee_cents_usd',
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

      if attributes.key?(:'mass_g')
        self.mass_g = attributes[:'mass_g']
      end

      if attributes.key?(:'production')
        self.production = attributes[:'production']
      end

      if attributes.key?(:'state')
        self.state = attributes[:'state']
      end

      if attributes.key?(:'allocation_state')
        self.allocation_state = attributes[:'allocation_state']
      end

      if attributes.key?(:'price_cents_usd')
        self.price_cents_usd = attributes[:'price_cents_usd']
      end

      if attributes.key?(:'patch_fee_cents_usd')
        self.patch_fee_cents_usd = attributes[:'patch_fee_cents_usd']
      end

      if attributes.key?(:'allocations')
        if (value = attributes[:'allocations']).is_a?(Array)
          self.allocations = value
        end
      end

      if attributes.key?(:'registry_url')
        self.registry_url = attributes[:'registry_url']
      end

      if attributes.key?(:'metadata')
        self.metadata = attributes[:'metadata']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @id.nil?
        invalid_properties.push('invalid value for "id", id cannot be nil.')
      end

      if @mass_g.nil?
        invalid_properties.push('invalid value for "mass_g", mass_g cannot be nil.')
      end

      if @mass_g > 2000000000
        invalid_properties.push('invalid value for "mass_g", must be smaller than or equal to 2000000000.')
      end

      if @mass_g < 0
        invalid_properties.push('invalid value for "mass_g", must be greater than or equal to 0.')
      end

      if @production.nil?
        invalid_properties.push('invalid value for "production", production cannot be nil.')
      end

      if @state.nil?
        invalid_properties.push('invalid value for "state", state cannot be nil.')
      end

      if @allocation_state.nil?
        invalid_properties.push('invalid value for "allocation_state", allocation_state cannot be nil.')
      end

      if @allocations.nil?
        invalid_properties.push('invalid value for "allocations", allocations cannot be nil.')
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
      return false if @mass_g.nil?
      return false if @mass_g > 2000000000
      return false if @mass_g < 0
      return false if @production.nil?
      return false if @state.nil?
      state_validator = EnumAttributeValidator.new('String', ["draft", "placed", "processing", "complete", "cancelled"])
      return false unless state_validator.valid?(@state)
      return false if @allocation_state.nil?
      allocation_state_validator = EnumAttributeValidator.new('String', ["pending", "partially_allocated", "allocated"])
      return false unless allocation_state_validator.valid?(@allocation_state)
      return false if @allocations.nil?
      return false if @metadata.nil?
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] mass_g Value to be assigned
    def mass_g=(mass_g)
      if mass_g.nil?
        fail ArgumentError, 'mass_g cannot be nil'
      end

      if mass_g > 2000000000
        fail ArgumentError, 'invalid value for "mass_g", must be smaller than or equal to 2000000000.'
      end

      if mass_g < 0
        fail ArgumentError, 'invalid value for "mass_g", must be greater than or equal to 0.'
      end

      @mass_g = mass_g
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] state Object to be assigned
    def state=(state)
      validator = EnumAttributeValidator.new('String', ["draft", "placed", "processing", "complete", "cancelled"])
      unless validator.valid?(state)
        fail ArgumentError, "invalid value for \"state\", must be one of #{validator.allowable_values}."
      end
      @state = state
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] allocation_state Object to be assigned
    def allocation_state=(allocation_state)
      validator = EnumAttributeValidator.new('String', ["pending", "partially_allocated", "allocated"])
      unless validator.valid?(allocation_state)
        fail ArgumentError, "invalid value for \"allocation_state\", must be one of #{validator.allowable_values}."
      end
      @allocation_state = allocation_state
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          mass_g == o.mass_g &&
          production == o.production &&
          state == o.state &&
          allocation_state == o.allocation_state &&
          price_cents_usd == o.price_cents_usd &&
          patch_fee_cents_usd == o.patch_fee_cents_usd &&
          allocations == o.allocations &&
          registry_url == o.registry_url &&
          metadata == o.metadata
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, mass_g, production, state, allocation_state, price_cents_usd, patch_fee_cents_usd, allocations, registry_url, metadata].hash
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
