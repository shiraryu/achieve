require 'rails_helper'

describe Contact do
  # 名前とemail、内容があれば有効な状態であること
  it "is valid with all" do
    contact = Contact.new(name: '宮岡さん', email: 'spec@yahoo.jp', content: 'こんにちは')
    expect(contact).to be_valid
  end

  #名前がなければ無効であること
  it "is invalid without a name" do
    contact = Contact.new
    expect(contact).not_to be_valid
  end

  #emailがなければ無効であること
  it "is valid with email" do
    contact = Contact.new
    contact.valid?
    expect(contact.errors[:email]).to include("を入力してください")
  end

  #内容がなければ無効であること
  it "is valid with content" do
    contact = Contact.new
    contact.valid?
    expect(contact.errors[:content]).to include("を入力してください")
  end
end
