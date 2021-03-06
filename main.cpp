#include <iostream>
#include <fstream>

#include <tins/tins.h>

using std::cout;
using std::endl;
using std::ofstream;
using std::streambuf;

using namespace Tins;

bool callbackfunc(const PDU &pdu)
{
    // The packet probably looks like this:
    //
    // EthernetII / IP / TCP / RawPDU
    //
    // So we retrieve the RawPDU layer, and construct a
    // TCP PDU using its contents.
    const RawPDU &raw = pdu.rfind_pdu<RawPDU>();

    // Retrive the content (payload)
    for(const auto &payload: raw.payload())
    {
        cout << payload;
        //outputfile << payload;
    }
    cout << endl;

    return true;
}

int main(int argc, char **argv)
{
    if(argc != 2)
    {
        cout << "Usage: " << *argv << " <interface>" << endl;
        return 1;
    }

    // Sniff on the provided interface in promiscuos mode
    SnifferConfiguration config;
    config.set_promisc_mode(true);
    config.set_immediate_mode(true);
    // Only capture TCP packets sent to port 80
    config.set_filter("tcp and dst port 80");
    Sniffer sniffer(argv[1], config);
    // Open output file
    ofstream outputfile;
    outputfile.open("output.txt", ofstream::out | ofstream::app);
    streambuf *coutbuf = cout.rdbuf(); // save lod buf
    cout.rdbuf(outputfile.rdbuf()); // redirect std::cout to output.txt

    // Start the capture
    sniffer.sniff_loop(callbackfunc);
}
