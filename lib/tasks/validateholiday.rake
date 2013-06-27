require 'rake'
namespace :validateholiday do
  desc "Obtener Proximo Feriado"
  task :viewholiday => :environment do 
    @feriado = Holiday.where("date >= '#{Time.now}'").find(:first, :order => 'date')
    
    if Time.now + 14.days < @feriado.date
      puts "AUN FALTA PARA EL PROXIMO FERIADO: '#{@feriado.description}', EL '#{@feriado.date}'."
    else 
      @clientes = Costumer.first
      puts @clientes.email
    end
  end
end