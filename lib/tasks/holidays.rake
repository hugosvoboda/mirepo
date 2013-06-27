require 'rake'
namespace :holidays do
  desc "Obtener Proximo Feriado"
  task :getnextholiday => :environment do 
    @feriado = Holiday.where("date >= '#{Time.now}'").find(:first, :order => 'date')
    
    if Time.now + 7.days < @feriado.date
      puts "AUN FALTA PARA EL PROXIMO FERIADO: '#{@feriado.description}', EL '#{@feriado.date}'."
    else 
      @clientes = Costumer.all

      @clientes.each do |cliente|
        UserMailer.demo_mail(cliente,@feriado).deliver!
      end
    end
  end
end