require 'rails_helper'
require "get_user"

describe UserUtil do
    context 'when initialized with incorrect number of arguments' do
      [[], [1], [1, 2, 3], [1, 2, 3, 4]].each do |args|
        it { expect { UserUtil.new(*args) }.to raise_error(ArgumentError) }
      end
    end
  
    context 'when initialized with correct arguments' do
      it { expect(UserUtil.new("https://google.com", 'YYIIIIUU')).to be_a(UserUtil) }
    end

    context 'when incorrect datatype is passed to getUsers offset named argument' do 
        it { expect { UserUtil.new("https://google.com", 'YYIIIIUU').getUsers(offset:"offset",limit:1) }.to raise_error(/offset must be an integer/)}
    end

    context 'when incorrect datatype is passed to getUsers limit named argument' do 
        it { expect { UserUtil.new("https://google.com", 'YYIIIIUU').getUsers(offset:1,limit:"limit") }.to raise_error(/limit must be an integer/)}
    end
end