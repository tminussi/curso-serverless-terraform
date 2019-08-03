'use strict';

const nodemailer = require('nodemailer')
const transporter = nodemailer.createTransport({
  host: process.env.SMTP_SERVER,
  port: 465,
  secure: true,
  auth: {
    user: process.env.EMAIL_FROM,
    pass: process.env.EMAIL_FROM_PASSWORD
  }
});

module.exports.send = async event => {
  const emailPromises = []
  for (const record of event.Records) {
    const message = JSON.parse(record.body).Message
    emailPromises.push(transporter.sendMail({
      from: `"Reservas 👻" <${process.env.EMAIL_FROM}>`, // sender address
      to: process.env.EMAIL_TO,
      subject: "Reserva Efetuada ✔",
      text: message,
      html: message
    }));
  }
  await Promise.all(emailPromises)
  console.log("Todos e-mails enviados com sucesso");
  return { message: 'Go Serverless v1.0! Your function executed successfully!', event };
};
