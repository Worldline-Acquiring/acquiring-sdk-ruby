require 'worldline/acquiring/sdk/logging/obfuscation/obfuscation_rule'

module Worldline
  module Acquiring
    module SDK
      module Logging
        module Obfuscation
          # A class that can be used to obfuscate properties in JSON bodies.
          class BodyObfuscator

            # Creates a new body obfuscator.
            # This will contain some pre-defined obfuscation rules, as well as any provided custom rules
            #
            # @param additional_rules [Hash] An optional hash where the keys are property names and the values are
            #        functions that obfuscate a single value
            def initialize(additional_rules = nil)
              @obfuscation_rules = {
                "address" => Obfuscation.obfuscate_all,
                "authenticationValue" => Obfuscation.obfuscate_all_but_first(4),
                "bin" => Obfuscation.obfuscate_all_but_first(6),
                "cardholderAddress" => Obfuscation.obfuscate_all,
                "cardholderPostalCode" => Obfuscation.obfuscate_all,
                "cardNumber" => Obfuscation.obfuscate_all_but_last(4),
                "cardSecurityCode" => Obfuscation.obfuscate_all,
                "city" => Obfuscation.obfuscate_all,
                "cryptogram" => Obfuscation.obfuscate_all_but_first(4),
                "expiryDate" => Obfuscation.obfuscate_all_but_last(4),
                "name" => Obfuscation.obfuscate_all,
                "paymentAccountReference" => Obfuscation.obfuscate_all_but_first(6),
                "postalCode" => Obfuscation.obfuscate_all,
                "stateCode" => Obfuscation.obfuscate_all,
              }
              if additional_rules
                additional_rules.each do |name, rule|
                  @obfuscation_rules[name] = rule
                end
              end

              @property_pattern = build_property_pattern(@obfuscation_rules.keys)
            end

            private

            def build_property_pattern(pn)
              return /$^/ if pn.empty? # no possible match
              # Regex to create:
              # (["'])(X|Y|Z)\1\s*:\s*(?:(["'])(.*?)(?<!\\)\3|([^"'\s\[\{]\S*))
              # Groups:
              # 1: opening " or ' for the property name
              # 2: property name
              # 3: opening " or ' for the value
              # 4: quoted value
              # 5: non-quoted-value
              # The negative lookbehind is to allow escaped quotes to be part of
              # the value. What this does not allow currently is having values end
              # with a \ (which would be escaped to \\).
              regex = pn.inject("([\"'])(") { |r, p| "#{r}#{Regexp.quote(p)}|" }.chop <<
                ")\\1\\s*:\\s*(?:([\"'])(.*?)(?<!\\\\)\\3|([^\"'\\s\\[\\{]((?!,)\\S)*))"
              /#{regex}/m # dotall mode
            end

            def obfuscate_value(property_name, value)
              obfuscation_rule = @obfuscation_rules[property_name]
              return obfuscation_rule.call(value) if obfuscation_rule
              value
            end

            public

            # Obfuscates the given body as necessary.
            #
            # @return (String)
            def obfuscate_body(body)
              return nil if body.nil?
              return '' if body.empty?

              body.gsub(@property_pattern) do
                m = Regexp.last_match
                property_name = m[2]
                value = m[4] || m[5]
                # copy value 'cause it's part of m[0]
                m[0].sub(value, obfuscate_value(property_name, value.dup))
              end
            end

            private

            DEFAULT_OBFUSCATOR = BodyObfuscator.new

            public

            # @return [BodyObfuscator]
            def self.default_obfuscator
              DEFAULT_OBFUSCATOR
            end
          end
        end
      end
    end
  end
end
