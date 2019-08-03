'use strict';

const AWS = require('aws-sdk')
AWS.config.update({
  region: process.env.AWS_REGION
})
const bcrypt = require('bcryptjs')
const uuid = require('uuid/v4')

const documentClient = new AWS.DynamoDB.DocumentClient()

module.exports.register = async event => {
  const body = JSON.parse(event.body)
  await documentClient.put({
    TableName: process.env.DYNAMODB_USERS,
    Item: {
      id: uuid(),
      name: body.name,
      email: body.email,
      password: bcrypt.hashSync(body.password, 10)
    }
  }).promise()

  return {
    statusCode: 201,
    body: JSON.stringify({ message: 'Usuário inserido com sucesso!' })
  }

};
