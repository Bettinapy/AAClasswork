import { fetchBenches } from '../util/bench_api_util';
export const RECEIVE_BENCHES = "RECEIVE_BENCHES";

export const receiveBenches = (benches) => {
    return{
        type: RECEIVE_BENCHES,
        benches
    }
}

export const fetchAllBenches = () => {
    return(dispatch)=>{
        fetchBenches().then(
            (benches)=>dispatch(receiveBenches(benches)),
            (errors) => console.log(errors)
            )
    }
}