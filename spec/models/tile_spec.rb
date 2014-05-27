require 'spec_helper'

describe Tile do

  before { @tile = Tile.new(word: "Crimson", timestamp: Time.now )}

  subject { @tile }

  it { should respond_to :word }
  it { should respond_to :timestamp }
end
