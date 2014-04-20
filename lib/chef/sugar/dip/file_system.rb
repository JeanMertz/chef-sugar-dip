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
    module FileSystem
      extend self

      #
      # Returns temporary storage path, with optional appended string
      #
      # @example create file path to download file to
      #
      #   tmp('elasticsearch/v2.0.0.tar.gz')
      #   => /var/chef/cache/elasticsearch/v2.0.0.tar.gz
      #
      # @param [String] path
      #   a string that is appended to the temporary path
      #
      def tmp(path = nil)
        File.join(*[Chef::Config[:file_cache_path], path].compact)
      end
    end

    module DSL
      # @see Chef::Sugar::FileSystem#tmp
      def tmp(path = nil); Chef::Sugar::FileSystem.tmp(path); end
    end
  end
end
