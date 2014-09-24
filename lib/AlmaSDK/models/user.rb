require 'active_model'

class User
  include ActiveModel::Model
  include ActiveModel::Serialization

  attr_accessor :id, :record_type, :primary_id, :first_name, :middle_name, :last_name, :pin_number, :job_category,
                :job_description, :gender, :user_group, :campus_code, :web_site_url, :preferred_language,
                :birth_date, :expiry_date, :account_type, :external_id, :password, :force_password_change,
                :status, :contact_info, :user_identifiers, :user_roles, :user_blocks, :user_notes, :user_statistics

end
