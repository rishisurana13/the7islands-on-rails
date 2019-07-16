# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :products, :name, :balance
end
