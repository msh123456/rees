<?php

class ControllerAccountBscript extends Controller
{
    public function index()
    {
        for ($i = 1; $i <= 25; $i++) {
            $res2 = $this->db->query("INSERT INTO dwc_category_filter(category_id,filter_id)
                      VALUES(" . 63 . "," . $i . ")");
        }
    }


}