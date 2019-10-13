module AccountsHelper

    def field_class(acct, field)
        acct.errors[field] ? "field-with-errors" : "field"
    end 
end
