class MyScaffoldControllerGenerator < Rails::Generators::NamedBase
  include Rails::Generators::ResourceHelpers
  source_root File.expand_path("templates", __dir__)
  attr_accessor :attributes

  def generate_controllers_and_views
    generate "scaffold_controller", "#{singular_name} " + editable_attributes.map { |a| a.name.to_s + ":" + a.type.to_s }.join(" ")
  end

  def create_services
    template "services/add.rb", "./app/services/#{plural_name}/add.rb"
    template "services/amend.rb", "./app/services/#{plural_name}/amend.rb"
  end

  private

  def model_exists?
    File.exist?("#{Rails.root}/app/models/#{singular_name}.rb")
  end

  def model_columns_for_attributes
    class_name.constantize.columns.reject do |column|
      column.name.to_s =~ /^(id|user_id|created_at|updated_at)$/
    end
  end

  def editable_attributes
    attributes || if model_exists?
      model_columns_for_attributes.map do |column|
        Rails::Generators::GeneratedAttribute.new(column.name.to_s, column.type.to_s)
      end
    else
      []
    end
  end
end
