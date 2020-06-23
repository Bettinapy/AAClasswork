
class User < ApplicationRecord
    validates :user_name, :password_digest, :session_token, presence: true
    validates :session_token, :user_name, uniqueness: true
    validates :password, length: { minimum: 6 }, allow_nil: true
    
    after_initialize :ensure_session_token
    
    has_many :cats,
        foreign_key: :user_id,
        class_name: :Cat

    has_many :requests,
        foreign_key: :user_id,
        class_name: :CatRentalRequest
    attr_reader :password
    def self.find_by_credentials(user_name, password)
        user = User.find_by(user_name: user_name)
        return nil unless user && user.is_password?(password)
        user
    end

    def reset_session_token!
        self.session_token = self.class.generate_session_token 
        self.save!
        self.session_token
    end

    def password=(password)
        @password = password 
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        bc_password = BCrypt::Password.new(self.password_digest)
        bc_password.is_password?(password)
    end

    private

	def ensure_session_token
		self.session_token ||= self.class.generate_session_token 
		# must be `||=` because when we query a User, .new gets called which would generate a new session token, which would mean the user is no longer logged in
    end
    
    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end
end
