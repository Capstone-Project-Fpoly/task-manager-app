import type { CodegenConfig } from '@graphql-codegen/cli'
import dotenv from 'dotenv'
dotenv.config()
const graphqlEndpoint =  `${process.env.BASE_URL}/graphql`

const config: CodegenConfig = {
  overwrite: true,
  schema: graphqlEndpoint,
  ignoreNoDocuments: true,
  generates: {
    './lib/schema.graphql': {
      plugins: ['schema-ast'],
      config: {
        maybeValue: 'T',
      },
    },
  },
}

export default config
