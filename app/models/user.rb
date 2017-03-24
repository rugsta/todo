class User < ActiveRecord::Base
	has_secure_password
	has_many :tasks

	include ActiveModel::SecurePassword::InstanceMethodsOnActivation
end
