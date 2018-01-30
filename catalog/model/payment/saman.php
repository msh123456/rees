<?php

class ModelPaymentSaman extends Model
{
    public function insert($data)
    {
        $query = "INSERT INTO " . DB_PREFIX . "saman (amount,resnum,user_id,order_id) 
	    VALUES('" . $this->db->escape($data['amount']) . "'"
            . ","
            . "'" . $this->db->escape($data['resnum']) . "'"
            . ","
            . "'" . $this->db->escape($data['user_id']) . "'"
            . ","
            . "'" . $this->db->escape($data['order_id']) . "'"
            . ")";
        try {
            $query = $this->db->query($query);
            return $this->db->getLastId();
        } catch (Exception $e) {
            return 0;
        }
    }

    public function update($data, $where)
    {
        $set = "";
        foreach ($data as $key => $value) {
            if ($set != "") $set .= ",";
            $set .= $key . "='" . $value . "' ";
        }
        $wh = "true ";
        foreach ($where as $key => $value)
            $wh .= "and " . $key . "='" . $value . "' ";
        $query = "UPDATE  " . DB_PREFIX . "saman set " . $set . " " . " where " . $wh . " ";

        $query = $this->db->query($query);
        return $this->db->countAffected();
    }
}