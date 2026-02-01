#include <stdio.h>
#include <libxml/parser.h>
#include <libxml/tree.h>

int main()
{
    xmlDocPtr doc = xmlNewDoc(BAD_CAST "1.0");
    
    xmlNodePtr root_node = xmlNewNode(NULL, BAD_CAST "root");
    xmlDocSetRootElement(doc, root_node);

    xmlNewChild(root_node, NULL, BAD_CAST "message", BAD_CAST "Hello XML Debugging");
    printf("XML created. Stop here to debug.\n");

    xmlFreeDoc(doc);
    xmlCleanupParser();
    return 0;
}