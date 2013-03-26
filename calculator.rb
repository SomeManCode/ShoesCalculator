Shoes.app :title => "My Amazing Calculator", :width => 240, :height => 240 do
  stack :margin => 20 do
    @output = edit_line
    

    #making buttons
    flow do
      %w(7 8 9 + / 5 6 7 * - 1 2 3 0).each do |op|      
        button op do         
          append op
        end
      end
      
      button "C" do
        clear_entry
      end


      button "=" do
        eval_expression
      end

    end

  end
  
  # Stick a string on the end of our input
  #

  def clear_entry()
    @input = ""
    @output.text = ""
  end

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
  
end
