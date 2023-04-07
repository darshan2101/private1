module ApplicationHelper
    def link_to_add_fields(name, form, association)

        # Takes an object (@user) and creates a new instance of its associated model (:addresses)
        # To better understand, run the following in your terminal:
        # rails c --sandbox
        # @user = user.new
        # new_object = @user.send(:addresses).klass.new
        new_object = form.object.send(association).klass.new

        # Saves the unique ID of the object into a variable.
        # This is needed to ensure the key of the associated array is unique. This is makes parsing the content in the `data-fields` attribute easier through Javascript.
        # We could use another method to achive this.
        id = new_object.object_id

        # https://api.rubyonrails.org/ fields_for(record_name, record_object = nil, fields_options = {}, &block)
        # record_name = :addresses
        # record_object = new_object
        # fields_options = { child_index: id }
            # child_index` is used to ensure the key of the associated array is unique, and that it matched the value in the `data-id` attribute.
            # `user[addresses_attributes][child_index_value][_destroy]`
        fields = form.fields_for(association, new_object, child_index: id) do |builder|

            # `association.to_s.singularize + "_fields"` ends up evaluating to `address_fields`
            # The render function will then look for `views/users/_address_fields.html.erb`
            # The render function also needs to be passed the value of 'builder', because `views/users/_address_fields.html.erb` needs this to render the form tags.
            render(association.to_s.singularize + "_fields", form: builder)
        end
    end
end
