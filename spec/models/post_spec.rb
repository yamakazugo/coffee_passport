require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end
  describe '新規投稿入力' do
    context '新規投稿入力ができるとき' do
       it 'imageとname、info、flavor_id、region_id、body_idacidity_id、processing_id、textが存在指定れば入力できる' do
        expect(@post).to be_valid
       end
    end
    context '商品情報入力ができないとき' do
       it 'imageがないと入力できない' do
         @post.image = nil
         @post.valid?
         expect(@post.errors.full_messages).to include("Image can't be blank")
       end
       it 'nameが空のとき入力できない' do
         @post.name = ""
         @post.valid?
         expect(@post.errors.full_messages).to include("Name can't be blank")
       end
       it 'infoが空のとき入力できない' do
         @post.info = ""
         @post.valid?
         expect(@post.errors.full_messages).to include("Info can't be blank")
       end
       it 'textが空のとき入力できない' do
         @post.text = ""
         @post.valid?
         expect(@post.errors.full_messages).to include("Text can't be blank")
       end
       it 'flavor_id がないと入力できない' do
        @post.flavor_id  = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Flavor Select")
       end
       it 'flavor_id が--のとき入力できない' do
         @post.flavor_id  = 1
         @post.valid?
         expect(@post.errors.full_messages).to include("Flavor Select")
       end
       it 'region_id がないと入力できない' do
        @post.region_id  = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Region Select")
       end
       it 'region_id が--のとき入力できない' do
         @post.region_id  = 1
         @post.valid?
         expect(@post.errors.full_messages).to include("Region Select")
       end
       it 'body_id がないと入力できない' do
        @post.body_id  = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Body Select")
       end
       it 'body_id が--のとき入力できない' do
         @post.body_id  = 1
         @post.valid?
         expect(@post.errors.full_messages).to include("Body Select")
       end
       it 'acidity_idがないと入力できない' do
         @post.acidity_id = nil
         @post.valid?
         expect(@post.errors.full_messages).to include("Acidity Select")
       end
       it 'acidity_idが--のとき入力できない' do
         @post.acidity_id = 1
         @post.valid?
         expect(@post.errors.full_messages).to include("Acidity Select")
       end
       it 'processing_id がないと入力できない' do
        @post.processing_id  = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Processing Select")
       end
       it 'processing_id が--のとき入力できない' do
         @post.processing_id  = 1
         @post.valid?
         expect(@post.errors.full_messages).to include("Processing Select")
        end
        it "ユーザーが紐付いていないとツイートは保存できない" do
          @post.user = nil
          @post.valid?
          expect(@post.errors.full_messages).to include("User must exist")
        end
    end  
  end

end
