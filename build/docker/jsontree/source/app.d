import vibe.d;
import jin.tree;
import std.stdio;

class WebService
{
    @path("/")
    void postUsername(HTTPServerRequest req,
    HTTPServerResponse res)
    {
        Json ans;
        try {
            ans = req.json;
        }
        catch(Exception e) {
            throw new HTTPStatusException(400);
        }
        auto treeFormat = ans.toString();
        Tree tree;
        tree = Tree.fromJSON(treeFormat);
        res.writeBody(tree.toString());
    }
}

void main()
{
    auto router = new URLRouter;
    router.registerWebInterface(new WebService);

    auto settings = new HTTPServerSettings;
    // Needed for SessionVar usage.
    settings.sessionStore = new MemorySessionStore;
	settings.bindAddresses = ["::", "127.0.0.1"];
    settings.port = 80;
    listenHTTP(settings, router);
    runApplication();
}