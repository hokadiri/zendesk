#! /usr/bin/env ruby
class Grade
  include Comparable
  attr_accessor :grade
  def initialize(grade)
    @grade = grade
  end
 
  def <=>(compareTo)
    num = (@grade[0].chr <=> compareTo.grade[0].chr)
    
    if num == -1 # A[] B[]
      return 1
    elsif num == 0 #A[] A[]
       if @grade[1] == nil and compareTo.grade[1] == nil #A A
         return 0
       elsif @grade[1] == nil and compareTo.grade[1] != nil
         if compareTo.grade[1].chr == '-' #A A-
           return 1
         else #A A+
           return -1
         end
       elsif @grade[1] != nil and compareTo.grade[1] == nil
         if @grade[1].chr == '-' #A- A
           return -1
         else #A+ A
           return 1
         end 
       else
         if @grade[1] == '-' and compareTo.grade[1] == '-' #A- A-
	   return 0
         elsif @grade[1] == '+' and compareTo.grade[1] == '-' #A+ A-
	   return 1
         elsif @grade[1] == '-' and compareTo.grade[1] == '+' #A- A+
	   return -1
         else #A+ A+
           return 0
         end
       end
    else #B A
      return -1 
    end
  end

  def first()
    return @grade[0].chr
  end

end
