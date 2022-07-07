import graphene
import events.schema

# Query for getting the data from the server.
class Query(events.schema.Query, graphene.ObjectType):
    pass

# Create schema
schema = graphene.Schema(query=Query)