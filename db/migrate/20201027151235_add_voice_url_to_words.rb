class AddVoiceUrlToWords < ActiveRecord::Migration[6.0]
  def change
    add_column :words, :female_voice_url, :string
    add_column :words, :male_voice_url, :string
  end
end
