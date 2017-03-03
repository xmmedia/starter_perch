import axios from 'axios';

// set the request with header by default
axios.defaults.headers.common = {
    'X-Requested-With': 'XMLHttpRequest'
};

export default axios;