=begin
#Patch API V1

#The core API used to integrate with Patch's service

The version of the OpenAPI document: v1
Contact: developers@usepatch.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.3.1

=end

require 'date'

module Patch
  class Project
    attr_accessor :id

    attr_accessor :production

    attr_accessor :name

    attr_accessor :description

    attr_accessor :type

    attr_accessor :country

    attr_accessor :developer

    attr_accessor :photos

    attr_accessor :average_price_per_tonne_cents_usd

    attr_accessor :remaining_mass_g

    attr_accessor :standard

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
        :'production' => :'production',
        :'name' => :'name',
        :'description' => :'description',
        :'type' => :'type',
        :'country' => :'country',
        :'developer' => :'developer',
        :'photos' => :'photos',
        :'average_price_per_tonne_cents_usd' => :'average_price_per_tonne_cents_usd',
        :'remaining_mass_g' => :'remaining_mass_g',
        :'standard' => :'standard'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'id' => :'String',
        :'production' => :'Boolean',
        :'name' => :'String',
        :'description' => :'String',
        :'type' => :'String',
        :'country' => :'String',
        :'developer' => :'String',
        :'photos' => :'Array<Photo>',
        :'average_price_per_tonne_cents_usd' => :'Integer',
        :'remaining_mass_g' => :'Integer',
        :'standard' => :'OneOfstandard'
      }
    end

    # Allows models with corresponding API classes to delegate API operations to those API classes
    # Exposes Model.operation_id which delegates to ModelsApi.new.operation_id
    # Eg. Order.create_order delegates to OrdersApi.new.create_order
    def self.method_missing(message, *args, &block)
      if Object.const_defined?('Patch::ProjectsApi::OPERATIONS') && Patch::ProjectsApi::OPERATIONS.include?(message)
        Patch::ProjectsApi.new.send(message, *args)
      else
        super
      end
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Patch::Project` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Patch::Project`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'production')
        self.production = attributes[:'production']
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.key?(:'country')
        self.country = attributes[:'country']
      end

      if attributes.key?(:'developer')
        self.developer = attributes[:'developer']
      end

      if attributes.key?(:'photos')
        if (value = attributes[:'photos']).is_a?(Array)
          self.photos = value
        end
      end

      if attributes.key?(:'average_price_per_tonne_cents_usd')
        self.average_price_per_tonne_cents_usd = attributes[:'average_price_per_tonne_cents_usd']
      end

      if attributes.key?(:'remaining_mass_g')
        self.remaining_mass_g = attributes[:'remaining_mass_g']
      end

      if attributes.key?(:'standard')
        self.standard = attributes[:'standard']
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

      if @name.nil?
        invalid_properties.push('invalid value for "name", name cannot be nil.')
      end

      if @description.nil?
        invalid_properties.push('invalid value for "description", description cannot be nil.')
      end

      if @country.nil?
        invalid_properties.push('invalid value for "country", country cannot be nil.')
      end

      if @developer.nil?
        invalid_properties.push('invalid value for "developer", developer cannot be nil.')
      end

      if @average_price_per_tonne_cents_usd.nil?
        invalid_properties.push('invalid value for "average_price_per_tonne_cents_usd", average_price_per_tonne_cents_usd cannot be nil.')
      end

      if @remaining_mass_g.nil?
        invalid_properties.push('invalid value for "remaining_mass_g", remaining_mass_g cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @id.nil?
      return false if @production.nil?
      return false if @name.nil?
      return false if @description.nil?
      type_validator = EnumAttributeValidator.new('String', ["biomass", "dac", "forestry", "mineralization", "ocean", "soil"])
      return false unless type_validator.valid?(@type)
      return false if @country.nil?
      return false if @developer.nil?
      return false if @average_price_per_tonne_cents_usd.nil?
      return false if @remaining_mass_g.nil?
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      validator = EnumAttributeValidator.new('String', ["biomass", "dac", "forestry", "mineralization", "ocean", "soil"])
      unless validator.valid?(type)
        fail ArgumentError, "invalid value for \"type\", must be one of #{validator.allowable_values}."
      end
      @type = type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          production == o.production &&
          name == o.name &&
          description == o.description &&
          type == o.type &&
          country == o.country &&
          developer == o.developer &&
          photos == o.photos &&
          average_price_per_tonne_cents_usd == o.average_price_per_tonne_cents_usd &&
          remaining_mass_g == o.remaining_mass_g &&
          standard == o.standard
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, production, name, description, type, country, developer, photos, average_price_per_tonne_cents_usd, remaining_mass_g, standard].hash
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
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
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
        Patch.const_get(type).build_from_hash(value)
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
