# This is like OpenStruct but allows you to create objects
# from nested hash i.e. {a: {b: 1}}
# See: http://andreapavoni.com/blog/2013/4/create-recursive-openstruct-from-a-ruby-hash/
require 'ostruct'
 
class DeepStruct < OpenStruct
  def initialize(hash=nil)
 
    @table = {}
    @hash_table = {}
 
    if hash
      recurse = Proc.new do |item|
        values = []
 
        item.each do |val|
          if val.is_a?(Hash)
            values.push(self.class.new(val))
          elsif val.is_a?(Array)
            values.push(recurse.call(val))
          else
            values.push(val)
          end
        end
 
        item.clear
        item.push(*values)
 
        item
      end
 
      hash.each do |k,v|
 
        if v.is_a?(Array)
          recurse.call(v)
        end
 
        @table[k.to_sym] = (v.is_a?(Hash) ? self.class.new(v) : v)
        @hash_table[k.to_sym] = v
        new_ostruct_member(k)
 
      end
    end
  end
 
  def to_h
    @hash_table
  end
 
end
