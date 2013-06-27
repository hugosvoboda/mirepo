class UserMailer < ActionMailer::Base
  default from: "hugosvoboda@gmail.com"

  def demo_mail(cliente, feriado)
    mail(:from => "hugosvoboda@gmail.com",
         :to => cliente.email,
         :subject => "Holidays Reminder :: Proximo Feriado",
         :body =>  "Hola #{cliente.name}, como estas? 
         Tenemos una noticia genial para vos. Se aproxima un Feriado! 
         Se conmemora '#{feriado.description}' y es el #{feriado.date}.

         Saludos!

         Holidays Reminder"
         )
  end
end
