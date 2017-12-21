<?php

class ModelDesignBanner extends Model
{
    public function getBanner($banner_id, $limit = "")
    {
        $sql = "SELECT * FROM " . DB_PREFIX . "banner_image bi LEFT JOIN "
            . DB_PREFIX . "banner_image_description bid ON (bi.banner_image_id  = bid.banner_image_id) WHERE bi.banner_id = '" . (int)$banner_id . "' AND bid.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY bi.sort_order ASC";
        if ($limit != "") {
            $sql .= " limit " . $limit;
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }
}