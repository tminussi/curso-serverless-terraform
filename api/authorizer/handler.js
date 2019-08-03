const jwt = require('jsonwebtoken')

exports.authorizer = function (event, context, callback) {
    const token = event.authorizationToken;
    try {
        const user = jwt.verify(token, process.env.JWT_SECRET)
        callback(null, generatePolicy('user', 'Allow', event.methodArn, user));
    } catch (e) {
        console.log(e)
        callback(null, generatePolicy('user', 'Deny', event.methodArn));
    }
};

const generatePolicy = function (principalId, effect, resource, user) {
    const authResponse = {};

    authResponse.principalId = principalId;
    if (effect && resource) {
        const policyDocument = {};
        policyDocument.Version = '2012-10-17';
        policyDocument.Statement = [];
        const statementOne = {};
        statementOne.Action = 'execute-api:Invoke';
        statementOne.Effect = effect;
        statementOne.Resource = resource;
        policyDocument.Statement[0] = statementOne;
        authResponse.policyDocument = policyDocument;
    }

    if (user) {
        authResponse.context = user;
    }
    return authResponse;
}