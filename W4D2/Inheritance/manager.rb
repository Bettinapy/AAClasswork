require_relative "employee"

class Manager < Employee
    attr_reader :employees
    def initialize(name, title, salary, boss = nil)
        super(name, title, salary, boss)
        @employees = []
    end

    def add_employee(employee)
        self.employees << employee
    end
    
    protected
    def salary_all
        all_salary = []
        @employees.each do |employee|
            all_salary << employee.salary
            
            if employee.is_a?(Manager)
                all_salary += employee.salary_all
            end
        end
        all_salary
    end

    def bonus(multiplier)
        salary_all.sum * multiplier
    end
end