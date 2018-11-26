Then("Veo la tabla {string}") do |string|
    tablehtml = find('table').native.inner_html  
    tablehtml.delete!("\n") 
    tablehtml.should include(string)
    
  end

