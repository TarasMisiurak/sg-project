class AddFieldsToVacancies < ActiveRecord::Migration
  def change
    add_column :vacancies, :title, :string
    add_column :vacancies, :location, :string
    add_column :vacancies, :desc, :text
    add_column :vacancies, :responsibilities, :text
    add_column :vacancies, :requirements, :text
    add_column :vacancies, :additional_requirements, :text
  end
end
