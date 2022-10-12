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
  class CreateSeaShippingEstimateRequest
    attr_accessor :destination_country_code

    attr_accessor :destination_locode

    attr_accessor :destination_postal_code

    attr_accessor :origin_country_code

    attr_accessor :origin_locode

    attr_accessor :origin_postal_code

    attr_accessor :container_size_code

    attr_accessor :emissions_scope

    attr_accessor :freight_mass_g

    attr_accessor :freight_volume_cubic_m

    attr_accessor :number_of_containers

    attr_accessor :vessel_imo

    attr_accessor :project_id

    attr_accessor :create_order

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
        :'destination_country_code' => :'destination_country_code',
        :'destination_locode' => :'destination_locode',
        :'destination_postal_code' => :'destination_postal_code',
        :'origin_country_code' => :'origin_country_code',
        :'origin_locode' => :'origin_locode',
        :'origin_postal_code' => :'origin_postal_code',
        :'container_size_code' => :'container_size_code',
        :'emissions_scope' => :'emissions_scope',
        :'freight_mass_g' => :'freight_mass_g',
        :'freight_volume_cubic_m' => :'freight_volume_cubic_m',
        :'number_of_containers' => :'number_of_containers',
        :'vessel_imo' => :'vessel_imo',
        :'project_id' => :'project_id',
        :'create_order' => :'create_order'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'destination_country_code' => :'String',
        :'destination_locode' => :'String',
        :'destination_postal_code' => :'String',
        :'origin_country_code' => :'String',
        :'origin_locode' => :'String',
        :'origin_postal_code' => :'String',
        :'container_size_code' => :'String',
        :'emissions_scope' => :'String',
        :'freight_mass_g' => :'Integer',
        :'freight_volume_cubic_m' => :'Integer',
        :'number_of_containers' => :'Integer',
        :'vessel_imo' => :'Integer',
        :'project_id' => :'String',
        :'create_order' => :'Boolean'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'destination_country_code',
        :'destination_locode',
        :'destination_postal_code',
        :'origin_country_code',
        :'origin_locode',
        :'origin_postal_code',
        :'emissions_scope',
        :'freight_volume_cubic_m',
        :'number_of_containers',
        :'vessel_imo',
        :'project_id',
        :'create_order'
      ])
    end


    # Allows models with corresponding API classes to delegate API operations to those API classes
    # Exposes Model.operation_id which delegates to ModelsApi.new.operation_id
    # Eg. Order.create_order delegates to OrdersApi.new.create_order
    def self.method_missing(message, *args, &block)
      if Object.const_defined?('Patch::CreateSeaShippingEstimateRequestsApi::OPERATIONS') && Patch::CreateSeaShippingEstimateRequestsApi::OPERATIONS.include?(message)
        Patch::CreateSeaShippingEstimateRequestsApi.new.send(message, *args)
      else
        super
      end
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Patch::CreateSeaShippingEstimateRequest` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Patch::CreateSeaShippingEstimateRequest`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'destination_country_code')
        self.destination_country_code = attributes[:'destination_country_code']
      end

      if attributes.key?(:'destination_locode')
        self.destination_locode = attributes[:'destination_locode']
      end

      if attributes.key?(:'destination_postal_code')
        self.destination_postal_code = attributes[:'destination_postal_code']
      end

      if attributes.key?(:'origin_country_code')
        self.origin_country_code = attributes[:'origin_country_code']
      end

      if attributes.key?(:'origin_locode')
        self.origin_locode = attributes[:'origin_locode']
      end

      if attributes.key?(:'origin_postal_code')
        self.origin_postal_code = attributes[:'origin_postal_code']
      end

      if attributes.key?(:'container_size_code')
        self.container_size_code = attributes[:'container_size_code']
      end

      if attributes.key?(:'emissions_scope')
        self.emissions_scope = attributes[:'emissions_scope']
      else
        self.emissions_scope = 'ttw'
      end

      if attributes.key?(:'freight_mass_g')
        self.freight_mass_g = attributes[:'freight_mass_g']
      end

      if attributes.key?(:'freight_volume_cubic_m')
        self.freight_volume_cubic_m = attributes[:'freight_volume_cubic_m']
      end

      if attributes.key?(:'number_of_containers')
        self.number_of_containers = attributes[:'number_of_containers']
      end

      if attributes.key?(:'vessel_imo')
        self.vessel_imo = attributes[:'vessel_imo']
      end

      if attributes.key?(:'project_id')
        self.project_id = attributes[:'project_id']
      end

      if attributes.key?(:'create_order')
        self.create_order = attributes[:'create_order']
      else
        self.create_order = false
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@freight_mass_g.nil? && @freight_mass_g > 2000000000
        invalid_properties.push('invalid value for "freight_mass_g", must be smaller than or equal to 2000000000.')
      end

      if !@freight_mass_g.nil? && @freight_mass_g < 0
        invalid_properties.push('invalid value for "freight_mass_g", must be greater than or equal to 0.')
      end

      if !@freight_volume_cubic_m.nil? && @freight_volume_cubic_m < 0
        invalid_properties.push('invalid value for "freight_volume_cubic_m", must be greater than or equal to 0.')
      end

      if !@number_of_containers.nil? && @number_of_containers < 0
        invalid_properties.push('invalid value for "number_of_containers", must be greater than or equal to 0.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      container_size_code_validator = EnumAttributeValidator.new('String', ["20GP", "40GP", "22G1", "42G1", "40HC", "45G1"])
      return false unless container_size_code_validator.valid?(@container_size_code)
      emissions_scope_validator = EnumAttributeValidator.new('String', ["wtt", "ttw", "wtw"])
      return false unless emissions_scope_validator.valid?(@emissions_scope)
      return false if !@freight_mass_g.nil? && @freight_mass_g > 2000000000
      return false if !@freight_mass_g.nil? && @freight_mass_g < 0
      return false if !@freight_volume_cubic_m.nil? && @freight_volume_cubic_m < 0
      return false if !@number_of_containers.nil? && @number_of_containers < 0
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] container_size_code Object to be assigned
    def container_size_code=(container_size_code)
      validator = EnumAttributeValidator.new('String', ["20GP", "40GP", "22G1", "42G1", "40HC", "45G1"])
      unless validator.valid?(container_size_code)
        fail ArgumentError, "invalid value for \"container_size_code\", must be one of #{validator.allowable_values}."
      end
      @container_size_code = container_size_code
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] emissions_scope Object to be assigned
    def emissions_scope=(emissions_scope)
      validator = EnumAttributeValidator.new('String', ["wtt", "ttw", "wtw"])
      unless validator.valid?(emissions_scope)
        fail ArgumentError, "invalid value for \"emissions_scope\", must be one of #{validator.allowable_values}."
      end
      @emissions_scope = emissions_scope
    end

    # Custom attribute writer method with validation
    # @param [Object] freight_mass_g Value to be assigned
    def freight_mass_g=(freight_mass_g)
      if !freight_mass_g.nil? && freight_mass_g > 2000000000
        fail ArgumentError, 'invalid value for "freight_mass_g", must be smaller than or equal to 2000000000.'
      end

      if !freight_mass_g.nil? && freight_mass_g < 0
        fail ArgumentError, 'invalid value for "freight_mass_g", must be greater than or equal to 0.'
      end

      @freight_mass_g = freight_mass_g
    end

    # Custom attribute writer method with validation
    # @param [Object] freight_volume_cubic_m Value to be assigned
    def freight_volume_cubic_m=(freight_volume_cubic_m)
      if !freight_volume_cubic_m.nil? && freight_volume_cubic_m < 0
        fail ArgumentError, 'invalid value for "freight_volume_cubic_m", must be greater than or equal to 0.'
      end

      @freight_volume_cubic_m = freight_volume_cubic_m
    end

    # Custom attribute writer method with validation
    # @param [Object] number_of_containers Value to be assigned
    def number_of_containers=(number_of_containers)
      if !number_of_containers.nil? && number_of_containers < 0
        fail ArgumentError, 'invalid value for "number_of_containers", must be greater than or equal to 0.'
      end

      @number_of_containers = number_of_containers
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          destination_country_code == o.destination_country_code &&
          destination_locode == o.destination_locode &&
          destination_postal_code == o.destination_postal_code &&
          origin_country_code == o.origin_country_code &&
          origin_locode == o.origin_locode &&
          origin_postal_code == o.origin_postal_code &&
          container_size_code == o.container_size_code &&
          emissions_scope == o.emissions_scope &&
          freight_mass_g == o.freight_mass_g &&
          freight_volume_cubic_m == o.freight_volume_cubic_m &&
          number_of_containers == o.number_of_containers &&
          vessel_imo == o.vessel_imo &&
          project_id == o.project_id &&
          create_order == o.create_order
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [destination_country_code, destination_locode, destination_postal_code, origin_country_code, origin_locode, origin_postal_code, container_size_code, emissions_scope, freight_mass_g, freight_volume_cubic_m, number_of_containers, vessel_imo, project_id, create_order].hash
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
