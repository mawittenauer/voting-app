require 'spec_helper'
require 'rails_helper'

describe Campaign do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to have_many(:sides) }
  it { is_expected.to have_many(:votes) }
end
