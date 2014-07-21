# -*- encoding: utf-8 -*-
#
# Author:: Fletcher Nichol (<fnichol@nichol.ca>)
#
# Copyright (C) 2012, Fletcher Nichol
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module Kitchen

  # A logical configuration representing a test case or fixture that will be
  # executed on a platform.
  #
  # @author Fletcher Nichol <fnichol@nichol.ca>
  class Suite

    # @return [String] logical name of this suite
    attr_reader :name

    # @return [Array] Array of names of excluded platforms
    attr_reader :excludes

    # @return [Array] Array of names of only included platforms
    attr_reader :includes

    # @return [String] path of the test suite
    attr_reader :test_base_path

    # Constructs a new suite.
    #
    # @param [Hash] options configuration for a new suite
    # @option options [String] :name logical name of this suit (**Required**)
    # @option options [Array] :excludes Array of names of excluded platforms
    # @option options [Array] :includes Array of names of only included
    # @option options [String] :test_base_path path to the test suite
    #   platforms
    def initialize(options = {})
      @name = options.fetch(:name) do
        raise ClientError, "Suite#new requires option :name"
      end
      @excludes = options.fetch(:excludes, [])
      @includes = options.fetch(:includes, [])
      @test_base_path = options.fetch(:test_base_path, "")
    end
  end
end
