Shoes.app :title => "My Amazing Calculator", :width => 240, :height => 240 do
  stack :margin => 20 do
    @output = edit_line
    

    #making buttons
    flow do
      %w(7 8 9 + / 5 6 7 * - 1 2 3 0 C = ** sq).each do |op|
        #loop that goes through and checks each button value and calls appropriate message
        button op do 
          case op 
            when "C"
              clear_entry
            when "="
              eval_expression
            when "sq"
               square_root

               # @input = (Math.sqrt(@input)
               # @output.text = @input
            else
              append op
          end  
        end  
      end  
    end
  end
  
  #clears entry
  def clear_entry()
    @input = ""
    @output.text = ""
  end


  #Stick a string to the end of our input
  def append(s)
    if @input.nil?
      @input = ""
    end
    @input += s
    @output.text = @input
  end
  
  # Evaluate the input we've got so far
  #
  def eval_expression
    @input = eval(@input).to_s
    @output.text = @input
  end
  
  def square_root
    @input = Math.sqrt(@input.to_i).to_s
    @output.text = @input
  end
   
end
