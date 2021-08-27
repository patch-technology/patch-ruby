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
  class CreateProjectRequest
    attr_accessor :name

    attr_accessor :description

    attr_accessor :country

    attr_accessor :state

    attr_accessor :verifier

    attr_accessor :type

    attr_accessor :standard_type

    attr_accessor :longitude

    attr_accessor :latitude

    attr_accessor :production

    attr_accessor :organization_id

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
        :'name' => :'name'
        :'description' => :'description'
        :'country' => :'country'
        :'state' => :'state'
        :'verifier' => :'verifier'
        :'type' => :'type'
        :'standard_type' => :'standard_type'
        :'longitude' => :'longitude'
        :'latitude' => :'latitude'
        :'production' => :'production'
        :'organization_id' => :'organization_id'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'name' => :'String'
        :'description' => :'String'
        :'country' => :'String'
        :'state' => :'String'
        :'verifier' => :'String'
        :'type' => :'String'
        :'standard_type' => :'String'
        :'longitude' => :'String'
        :'latitude' => :'String'
        :'production' => :'String'
        :'organization_id' => :'String'
      }
    end

    # Set with nullable attributes.
    def self.openapi_nullable
      nullable_properties = Set.new

      nullable_properties.add("production")

      nullable_properties
    end

    # Allows models with corresponding API classes to delegate API operations to those API classes
    # Exposes Model.operation_id which delegates to ModelsApi.new.operation_id
    # Eg. Order.create_order delegates to OrdersApi.new.create_order
    def self.method_missing(message, *args, &block)
      if Object.const_defined?('Patch::CreateProjectRequestsApi::OPERATIONS') && Patch::CreateProjectRequestsApi::OPERATIONS.include?(message)
        Patch::CreateProjectRequestsApi.new.send(message, *args)
      else
        super
      end
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Patch::CreateProjectRequest` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Patch::CreateProjectRequest`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.key?(:'country')
        self.country = attributes[:'country']
      end

      if attributes.key?(:'state')
        self.state = attributes[:'state']
      end

      if attributes.key?(:'verifier')
        self.verifier = attributes[:'verifier']
      end

      if attributes.key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.key?(:'standard_type')
        self.standard_type = attributes[:'standard_type']
      end

      if attributes.key?(:'longitude')
        self.longitude = attributes[:'longitude']
      end

      if attributes.key?(:'latitude')
        self.latitude = attributes[:'latitude']
      end

      if attributes.key?(:'production')
        self.production = attributes[:'production']
      end

      if attributes.key?(:'organization_id')
        self.organization_id = attributes[:'organization_id']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      country_validator = EnumAttributeValidator.new('String', ["TJ", "JM", "HT", "ST", "MS", "AE", "PK", "NL", "LU", "BZ", "IR", "BO", "UY", "GH", "SA", "CI", "MF", "TF", "AI", "QA", "SX", "LY", "BV", "PG", "KG", "GQ", "EH", "NU", "PR", "GD", "KR", "HM", "SM", "SL", "CD", "MK", "TR", "DZ", "GE", "PS", "BB", "UA", "GP", "PF", "NA", "BW", "SY", "TG", "DO", "AQ", "CH", "MG", "FO", "VG", "GI", "BN", "LA", "IS", "EE", "UM", "LT", "RS", "MR", "AD", "HU", "TK", "MY", "AO", "CV", "NF", "PA", "GW", "BE", "PT", "GB", "IM", "US", "YE", "HK", "AZ", "CC", "ML", "SK", "VU", "TL", "HR", "SR", "MU", "CZ", "PM", "LS", "WS", "KM", "IT", "BI", "WF", "GN", "SG", "CO", "CN", "AW", "MA", "FI", "VA", "ZW", "KY", "BH", "PY", "EC", "LR", "RU", "PL", "OM", "MT", "SS", "DE", "TM", "SJ", "MM", "TT", "IL", "BD", "NR", "LK", "UG", "NG", "BQ", "MX", "CW", "SI", "MN", "CA", "AX", "VN", "TW", "JP", "IO", "RO", "BG", "GU", "BR", "AM", "ZM", "DJ", "JE", "AT", "CM", "SE", "FJ", "KZ", "GL", "GY", "CX", "MW", "TN", "ZA", "TO", "CY", "MV", "PN", "RW", "NI", "KN", "BJ", "ET", "GM", "TZ", "VC", "FK", "SD", "MC", "AU", "CL", "DK", "FR", "TC", "CU", "AL", "MZ", "BS", "NE", "GT", "LI", "NP", "BF", "PW", "KW", "IN", "GA", "TV", "MO", "SH", "MD", "CK", "AR", "SC", "IE", "ES", "LB", "BM", "RE", "KI", "AG", "MQ", "SV", "JO", "TH", "SO", "MH", "CG", "KP", "GF", "BA", "YT", "GS", "KE", "PE", "BT", "SZ", "CR", "TD", "DM", "NC", "GR", "GG", "HN", "VI", "CF", "SN", "AF", "MP", "PH", "BY", "LV", "NO", "EG", "KH", "IQ", "LC", "NZ", "BL", "UZ", "ID", "ER", "VE", "FM", "SB", "ME", "AS"])
      return false unless country_validator.valid?(@country)
      type_validator = EnumAttributeValidator.new('String', ["biomass", "dac", "forestry", "mineralization", "ocean", "renewables", "soil"])
      return false unless type_validator.valid?(@type)
      standard_type_validator = EnumAttributeValidator.new('String', ["american_carbon_registry", "climate_action_reserve", "verified_carbon_standard", "european_biochar_certificate", "gold_standard"])
      return false unless standard_type_validator.valid?(@standard_type)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] country Object to be assigned
    def country=(country)
      validator = EnumAttributeValidator.new('String', ["TJ", "JM", "HT", "ST", "MS", "AE", "PK", "NL", "LU", "BZ", "IR", "BO", "UY", "GH", "SA", "CI", "MF", "TF", "AI", "QA", "SX", "LY", "BV", "PG", "KG", "GQ", "EH", "NU", "PR", "GD", "KR", "HM", "SM", "SL", "CD", "MK", "TR", "DZ", "GE", "PS", "BB", "UA", "GP", "PF", "NA", "BW", "SY", "TG", "DO", "AQ", "CH", "MG", "FO", "VG", "GI", "BN", "LA", "IS", "EE", "UM", "LT", "RS", "MR", "AD", "HU", "TK", "MY", "AO", "CV", "NF", "PA", "GW", "BE", "PT", "GB", "IM", "US", "YE", "HK", "AZ", "CC", "ML", "SK", "VU", "TL", "HR", "SR", "MU", "CZ", "PM", "LS", "WS", "KM", "IT", "BI", "WF", "GN", "SG", "CO", "CN", "AW", "MA", "FI", "VA", "ZW", "KY", "BH", "PY", "EC", "LR", "RU", "PL", "OM", "MT", "SS", "DE", "TM", "SJ", "MM", "TT", "IL", "BD", "NR", "LK", "UG", "NG", "BQ", "MX", "CW", "SI", "MN", "CA", "AX", "VN", "TW", "JP", "IO", "RO", "BG", "GU", "BR", "AM", "ZM", "DJ", "JE", "AT", "CM", "SE", "FJ", "KZ", "GL", "GY", "CX", "MW", "TN", "ZA", "TO", "CY", "MV", "PN", "RW", "NI", "KN", "BJ", "ET", "GM", "TZ", "VC", "FK", "SD", "MC", "AU", "CL", "DK", "FR", "TC", "CU", "AL", "MZ", "BS", "NE", "GT", "LI", "NP", "BF", "PW", "KW", "IN", "GA", "TV", "MO", "SH", "MD", "CK", "AR", "SC", "IE", "ES", "LB", "BM", "RE", "KI", "AG", "MQ", "SV", "JO", "TH", "SO", "MH", "CG", "KP", "GF", "BA", "YT", "GS", "KE", "PE", "BT", "SZ", "CR", "TD", "DM", "NC", "GR", "GG", "HN", "VI", "CF", "SN", "AF", "MP", "PH", "BY", "LV", "NO", "EG", "KH", "IQ", "LC", "NZ", "BL", "UZ", "ID", "ER", "VE", "FM", "SB", "ME", "AS"])
      unless validator.valid?(country)
        fail ArgumentError, "invalid value for \"country\", must be one of #{validator.allowable_values}."
      end
      @country = country
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      validator = EnumAttributeValidator.new('String', ["biomass", "dac", "forestry", "mineralization", "ocean", "renewables", "soil"])
      unless validator.valid?(type)
        fail ArgumentError, "invalid value for \"type\", must be one of #{validator.allowable_values}."
      end
      @type = type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] standard_type Object to be assigned
    def standard_type=(standard_type)
      validator = EnumAttributeValidator.new('String', ["american_carbon_registry", "climate_action_reserve", "verified_carbon_standard", "european_biochar_certificate", "gold_standard"])
      unless validator.valid?(standard_type)
        fail ArgumentError, "invalid value for \"standard_type\", must be one of #{validator.allowable_values}."
      end
      @standard_type = standard_type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          name == o.name &&
          description == o.description &&
          country == o.country &&
          state == o.state &&
          verifier == o.verifier &&
          type == o.type &&
          standard_type == o.standard_type &&
          longitude == o.longitude &&
          latitude == o.latitude &&
          production == o.production &&
          organization_id == o.organization_id
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [namedescriptioncountrystateverifiertypestandard_typelongitudelatitudeproductionorganization_id].hash
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
