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
    module IP
      extend self

      #
      # Return node's public IP
      #
      # @param [Chef::Node] node
      #   the node to calculate the public IP for
      #
      # @return [String]
      #   the node's ip address
      #
      def public_ip(node)
        node['cloud'] ? node['cloud']['public_ipv4'] : node['ipaddress']
      end
    end

    module DSL
      # @see Chef::Sugar::IP#public_ip
      def public_ip(other = nil); Chef::Sugar::IP.public_ip(other || node); end
    end
  end
end
