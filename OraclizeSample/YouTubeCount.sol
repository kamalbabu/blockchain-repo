pragma solidity >= 0.5.0 < 0.6.0;

import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

contract YoutubeViews is usingOraclize {

    string public viewsCount;

    event LogYoutubeViewCount(string views);
    event LogNewOraclizeQuery(string description);

    constructor()
        public
    {
        update(); // Update views on contract creation...
    }

    function __callback(
        bytes32 _myid,
        string memory _result
    )
        public
    {
        require(msg.sender == oraclize_cbAddress());
        viewsCount = _result;
        emit LogYoutubeViewCount(viewsCount);
        // Do something with viewsCount, like tipping the author if viewsCount > X?
    }

    function update()
        public
        payable
    {
         if (oraclize_getPrice("URL") >(address (this).balance)) {
           emit LogNewOraclizeQuery("Oraclize query was NOT sent, please add some ETH to cover for the query fee");
       } else {
           emit LogNewOraclizeQuery("Oraclize query was sent, standing by for the answer..");
           oraclize_query("URL", 'html(https://www.youtube.com/watch?v=9bZkp7q19f0).xpath(//*[contains(@class, "watch-view-count")]/text())');
       }
        
        
        //emit LogNewOraclizeQuery("Oraclize query was sent, standing by for the answer...");
        //oraclize_query("URL", '');
    }
}