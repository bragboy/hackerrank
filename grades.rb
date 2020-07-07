def gradingStudents(grades)
  grades.map{|g| g < 38 ? g : ( [0,1,2].include?(g%5) ? g : (g + 5 - g%5) )}
end

puts gradingStudents([73, 80, 67, 38, 33])