require 'rails_helper'

RSpec.describe User, type: :model do
  # it "姓、名、メール、パスワードがある場合、有効である" do
  #   # userのそれぞれのカラムに対して値を入れてオブジェクト化する
  #   user = User.new(
  #     first_name: "tarou",
  #     family_name: "testman",
  #     email: "testman@example.com",
  #     password: "password",
  #     )
  #   # オブジェクトをexpectに渡した時に、有効である(be valid)という意味になります
  #   expect(user).to be_valid
  # end
  #
  # it "名がない場合、無効である" do
  #   # first_nameでnilを設定する
  #   user = User.new(
  #     first_name: nil,
  #     family_name: "testman",
  #     email: "testman@example.com",
  #     password: "password",
  #     )
  #   # valid?メソッドを呼び出すとエラー検証が行えます。次行のerrorsメソッドを使うために必要です。
  #   user.valid?
  #   # valid?メソッドでfalseであれば、user.errosでどんなerrorを持っているか返してくれます。今回は特に[:first_name]のエラーがみたいのでexpect()内部で指定してあげます。
  #   # 今回は"can't be blank"というエラーを含んでいる(include)しているはずという記述になります。複数含む場合ももちろんあります。
  #   expect(user.errors[:first_name]).to include("can't be blank")
  # end

  it "姓、名、メール、パスワードがある場合、有効である" do
    # user = FactoryBot.build(:user)
    # #spec/models/rails_helper.rbへの記載（config.include FactoryBot::Syntax::Methods）によって、FactoryBotを短縮
    user = build(:user)
    expect(user).to be_valid
  end

  it "名がない場合、無効である" do
    user = build(:user, first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "姓がない場合、無効である" do
    user = build(:user, family_name: nil)
    user.valid?
    expect(user.errors[:family_name]).to include("can't be blank")
  end

  it "メールアドレスがない場合、無効である" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "重複したメールアドレスの場合、無効である" do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.build(:user)
    user2.valid?
    expect(user2.errors[:email]).to include("has already been taken")
  end

  it "パスワードがない場合、無効である" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end
end




