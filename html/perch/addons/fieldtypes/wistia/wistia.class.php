<?php
/**
 * Creates a text field to put in the Wistia video ID.
 */
class PerchFieldType_wistia extends PerchAPI_FieldType
{
    /**
     * Output the form fields for the edit page
     *
     * @param array $details
     * @return string
     */
    public function render_inputs($details=array())
    {
        $id = $this->Tag->input_id();

        $val = '';
        if (isset($details[$id]) && $details[$id]!='') {
            $val = $details[$id]['path'];
        }

        $s = $this->Form->text($this->Tag->input_id(), $val, '', 100);

        $s .= '<span class="hint">Enter the full URL to the Wistia video. This will not work with any other video service, such as YouTube or Vimeo. Please contact XM Media if you need assistance.</span>';

        return $s;
    }

    /**
     * Read in the form input, prepare data for storage in the database.
     *
     * @param array $post
     * @param object $Item
     * @return array
     */
    public function get_raw($post=false, $Item=false)
    {
        $store = array();

        $id = $this->Tag->id();

        if ($post===false) {
            $post = $_POST;
        }

        $url = null;
        if (isset($post[$id])) {
            $this->raw_item = trim($post[$id]);
            $url = $this->raw_item;
        }

        if ($url) {
            $store['path'] = $url;
            $store['wistiaID'] = $this->get_id($url);
        }

        return $store;
    }

    /**
     * Get processed value
     *
     * @return string
     */
    public function get_processed($raw=false)
    {
        if ($raw===false) $raw = $this->get_raw();

        $videoId = $raw['wistiaID'];

        $this->processed_output_is_markup = true;

        $s = '<script src="//fast.wistia.com/embed/medias/'.$videoId.'.jsonp" async></script>
            <script src = "//fast.wistia.com/assets/external/E-v1.js" async></script>
            <div class="wistia_responsive_padding" style="padding:56.25% 0 0 0;position:relative;">
                <div class="wistia_responsive_wrapper" style="height:100%;left:0;position:absolute;top:0;width:100%;">
                    <div class="wistia_embed wistia_async_'.$videoId.' seo=false videoFoam=true" style="height:100%;width:100%"> </div>
                </div>
            </div>';

        return $s;
    }

    public function get_search_text($raw = false)
    {
        if ($raw===false) $raw = $this->get_raw();

        return $raw['path'];
    }

    /**
     * Parses the Wistia URL for the video ID.
     * Typical format: https://company.wistia.com/medias/ABC123
     * Where "ABC123" is the video ID.
     *
     * @param $url
     * @return bool|string
     */
    protected function get_id($url)
    {
        $parsed_path = parse_url($url, PHP_URL_PATH);

        if ($parsed_path) {
            return substr($parsed_path, strrpos($parsed_path, '/'));
        }

        return false;
    }
}