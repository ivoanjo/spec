# -*- encoding: binary -*-
require_relative '../../spec_helper'
require_relative 'fixtures/classes.rb'
require_relative 'shared/slice.rb'

describe "String#byteslice" do
  it "needs to reviewed for spec completeness"

  it_behaves_like :string_slice, :byteslice
end

describe "String#byteslice with index, length" do
  it_behaves_like :string_slice_index_length, :byteslice
end

describe "String#byteslice with Range" do
  it_behaves_like :string_slice_range, :byteslice
end

with_feature :encoding do
  describe "String#byteslice on on non ASCII strings" do
    it "returns byteslice of unicode strings" do
      "\u3042".byteslice(1).should == "\x81".force_encoding("UTF-8")
      "\u3042".byteslice(1, 2).should == "\x81\x82".force_encoding("UTF-8")
      "\u3042".byteslice(1..2).should == "\x81\x82".force_encoding("UTF-8")
      "\u3042".byteslice(-1).should == "\x82".force_encoding("UTF-8")
    end
  end
end
