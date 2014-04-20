#
# Copyright 2014, Jean Mertz <jean@mertz.fm>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

class Chef
  module Sugar
    module Cookbook
      extend self

      #
      # Return array of cookbook files
      #
      # @params [String] cookbook name
      #
      # @return [Array]
      #   the array of cookbook files
      #
      def files(node, cookbook_name)
        object(node, cookbook_name).send(:file_filenames)
      end

      #
      # Return path of cookbook file.
      #
      # @params [String] cookbook name
      # @params [String] file name
      #   if file is in subfolder, provide <folder/file_name>
      #
      # @return [String]
      #   path to cookbook file
      #
      def file_path(node, cookbook_name, path)
        object(node, cookbook_name)
          .preferred_filename_on_disk_location(node, :files, path)
      end

      #
      # Return array of cookbook templates
      #
      # @params [String] cookbook name
      #
      # @return [Array]
      #   the array of cookbook templates
      #
      def templates(node, cookbook_name)
        object(node, cookbook_name).send(:template_filenames)
      end

      #
      # Return Metadata object for current cookbook
      #
      # @params [String] cookbook name
      #
      # @return [Chef::Cookbook::Metadata]
      #   the metadata object of current cookbook
      #
      def metadata(node, cookbook_name)
        object(node, cookbook_name).metadata
      end

      #
      # Return absolute root path of cookbook
      #
      # @params [String] cookbook name
      #
      # @return [String]
      #   absolute path to cookbook
      #
      def root(node, cookbook_name)
        object(node, cookbook_name).send(:root_dir)
      end

      private

      #
      # Return Cookbook object
      #
      # @params [String] cookbook name
      #
      # @return [Chef::Cookbook]
      #
      def object(node, cookbook_name)
        node.run_context.cookbook_collection[cookbook_name]
      end
    end

    module DSL
      # @see Chef::Sugar::Cookbook#files
      def cookbook_files(cookbook_name)
        Chef::Sugar::Cookbook.files(node, cookbook_name)
      end

      # @see Chef::Sugar::Cookbook#file
      def cookbook_file_path(cookbook_name, path)
        Chef::Sugar::Cookbook.file_path(node, cookbook_name, path)
      end

      # @see Chef::Sugar::Cookbook#templates
      def cookbook_templates(cookbook_name)
        Chef::Sugar::Cookbook.templates(node, cookbook_name)
      end

      # @see Chef::Sugar::Cookbook#metadata
      def metadata(cookbook_name)
        Chef::Sugar::Cookbook.metadata(node, cookbook_name)
      end

      # @see Chef::Sugar::Cookbook#root
      def cookbook_root(cookbook_name)
        Chef::Sugar::Cookbook.root(node, cookbook_name)
      end
    end
  end
end
