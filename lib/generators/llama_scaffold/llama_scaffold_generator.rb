# lib/generators/llama_scaffold/llama_scaffold_generator.rb
require 'rails/generators'
require 'rails/generators/rails/scaffold/scaffold_generator'

module Generators
  module LlamaScaffold
    class LlamaScaffoldGenerator < Rails::Generators::ScaffoldGenerator
      source_root Rails::Generators::ScaffoldGenerator.source_root

      def add_data_llama_tags
        append_data_tags_to_views
      end

      def set_default_layout
        #TODO: Do we want to have a different layout for this llama_scaffold, than for the entire application? 
        # Discuss with Danish.

        # The below code will inject the layout into the controller of the new model.

        # inject_into_class(
        #   File.join("app/controllers", class_path, "#{controller_file_name}_controller.rb"),
        #   "#{controller_class_name}Controller",
        #   "  layout 'static_website'\n"
        # )
      end

      private

      def append_data_tags_to_views
        view_files.each do |view_file|
          insert_data_tags_into_file(view_file)
        end
      end

      def view_files
        Dir.glob(File.join(destination_root, "app/views/#{controller_file_path}/**/*.html.erb"))
      end

      def insert_data_tags_into_file(view_file)
        relative_path = view_file.sub("#{destination_root}/", '')
        content = File.read(view_file)
        
        modified_content = content.gsub(/(<[^!%\/][^>]*?)(\s*\/?>)/) do |match|
          opening_tag = $1
          closing = $2
          if opening_tag.include?('data-llama')
            match
          else
            "#{opening_tag} data-llama=\"#{relative_path}\"#{closing}"
          end
        end

        File.write(view_file, modified_content)
      end
    end
  end
end